# coding: utf-8
require 'faker'
$KCODE = "U"
require "active_support"

def list_entries(path)
  entries = []
  Dir.chdir(path) { entries = Dir["**"] }
  entries.sort
end

class Seeder
  def seed
    @data = RAILS_ROOT + '/db/data'
    intro = create_section('intro')
    acciones = create_section('acciones')
    create_section('tutorial')
    create_section('faq')

    prepare_directories
    create_videos(intro)
    create_videos(acciones)

    if RAILS_ENV != 'production'
      User.create!(:email => 'flo@flo.com', :password => 'floflo')
    end
  end

  def create_videos(section)
    folder = "#{@data}/videos/#{section.name}"
    puts "Loading videos from: #{folder}"
    list_entries(folder).each do |entry|
      name = entry.gsub(/[-_]/, ' ')
      name.gsub!(/\.\w\w\w$/, '')
      puts "Video: #{name} (#{entry})"
      video = Video.find_or_create_by_title(name)
      video.section_id = section.id
      video.generator = 'vimeo'
      video.url = 'http://vimeo.com/6631139'
      filename = "#{folder}/#{entry}"
      raise Exception.new("#{filename} no existe!") unless File.exists?(filename)
      if filename =~ /jpg$/
        puts "Preview: #{filename}"
        video.preview = File.new(filename)
      else
        puts "Animation: #{filename}"
        video.animation = File.new(filename)
      end
      video.save!
    end
  end

  def prepare_directories
    if RAILS_ENV != 'production'
      @output = RAILS_ROOT + "/public/system"
      FileUtils.remove_dir @output if File.exist?(@output)
      Dir.mkdir(@output)
    end
  end



  def create_section(name)
    path = "#{@data}/#{name}.txt"
    s = Section.new(:name => name, :title => name)
    File.open(path, "r") {|f| s.body = f.readlines.join} if File.exist?(path)
    puts s.save ? "Section #{name} saved!" : "Problem saving section #{name}"
    s
  end

  def add_comments(section)
    1.upto(rand(20) + 30) do
      Comment.create!(:section_id => section.id, :body => Faker::Lorem.sentence(rand(15) + 1))
    end
  end
end

class Commenteer
  def import
    puts "COMENTEER"
    data = RAILS_ROOT + '/db/data/comentarios.txt'
    File.readlines(data).each do |line|
      if line =~ /^\s*$/
        #puts '.'
      elsif line =~ /^\s*\*\*\*(.*)$/
        set_video($1)
      elsif line =~ /^(.+)\|(.*)$/
        open_comment($1, $2)
      else
        add_line(line)
      end
    end
    save_comment
  end

  def add_line(line)
    if @comment
      @comment.body = @comment.body + ' ' +  line
    end
  end

  def open_comment(user, fecha)
    if @video
      save_comment
      user.strip!
      fecha.strip!.gsub!(/\s/, '')
      year = fecha[6..9]
      month = fecha[3..4]
      day = fecha[0..1]
      date = Date.civil(year.to_i, month.to_i, day.to_i)
      @comment = Comment.new(:video_id => @video.id, :author => user, :published_at => date, :body => '', :email => 'flo')
      puts "Comentario: #{user} #{fecha} #{day}/#{month}/#{year} "
    end
  end

  def save_comment
    if @comment
      puts "Guardando comentario: #{@comment.author} #{@comment.published_at.fecha}"
      puts "#{@comment.body}"
      @comment.save!
      @comment = nil
    end
  end

  def set_video(name)
    name = name.strip.chars.downcase
    @video = Video.find_by_title(name)
    if @video.nil?
      puts "*** FALTA: #{name.downcase}"
    else
      puts "Vídeo actual: #{@video.title}"
    end
  end

end

class Carteleria
  def seed
    puts "CARTELERIA"
    path = RAILS_ROOT + '/db/data/carteles'
    list_entries(path).each do |entry|
      name = entry.gsub(/[-_]/, ' ')[0..-5]
      name[0] = name[0,1].upcase
      puts "Cartel: #{name}"
      filename = File.join(path, entry)
      cartel = Cartel.new(:title => name)
      cartel.image = File.new(filename)
      cartel.save!
      cartel.image.reprocess!
      cartel.save!
    end
  end
end

Seeder.new.seed if Section.count == 0
Carteleria.new.seed if Cartel.count == 0
Comment.destroy_all
Commenteer.new.import if Comment.count == 0


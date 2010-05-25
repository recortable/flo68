# coding: utf-8
require 'faker'
$KCODE = "U"
require "active_support"

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
    load_entries(folder).each do |entry|
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

  def load_entries(path)
    entries = []
    Dir.chdir(path) { entries = Dir["**"] }
    entries.sort
  end

  def create_section(name)
    path = "#{@data}/#{name}.html"
    s = Section.new(:name => name, :title => name)
    File.open(path, "r") {|f| s.body = f.readlines.join}
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
    Video.all.each {|video| puts "'#{video.title}'"}
    data = RAILS_ROOT + '/db/data/comentarios.txt'
    File.readlines(data).each do |line|
      if line =~ /^\s*$/
        #puts '.'
      elsif line =~ /^\s*\*\*\*(.*)$/
        set_video($1)
      elsif line =~ /^(.+)\|(.*)$/
        #puts "Comentario: #{$1} #{$2}"
      else
        #puts line
      end
    end
  end

  def set_video(name)
    name = name.strip.chars.downcase
    @video = Video.find_by_title(name)
    if @video.nil?
      puts "FALTA: #{name.downcase}"
    end
  end

end

Seeder.new.seed if Section.count == 0
Commenteer.new.import



class Seed
  def initialize
    @data = RAILS_ROOT + '/db/data/'
    intro = create_section('intro')
    add_videos(intro, ['actuación de LA BRUJA', 'actuación del MONO', 'mis cosillas'])
    acciones = create_section('acciones')
    add_videos(acciones, ['actuación de LA BRUJA', 'actuación del TIPO DE INTERÉS', 'actuación de LA NIÑA NINJA',
        'actuación del VARGA', 'actuación de LA BRUJA', 'actuación del TIPO DE INTERÉS', 'actuación de LA BRUJA', 'actuación del TIPO DE INTERÉS' ])
    create_section('tutorial')
    create_section('faq')
  end

  def create_section(name)
    path = "#{@data}#{name}.html"
    s = Section.new(:name => name, :title => name)
    File.open(path, "r") {|f| s.body = f.readlines.join}
    puts s.save ? "Section #{name} saved!" : "Problem saving section #{name}"
    s
  end

  PREVIEW = ['videos/thumbnail1.gif']
  def add_videos(section, names)
    names.each do |name|
      video = Video.create!(:title => name, :section_id => section.id, :generator => 'vimeo', :url => 'http://vimeo.com/6631139')
      path = "videos/thumbnail#{rand(2) + 1}.gif"
      puts "Video #{name}: #{path}"
      video.preview = File.new("#{@data}#{path}")
      video.preview.reprocess!
      puts video.save ? "Video #{name} saved!" : "Problem saving video #{name}"
    end
  end
end

Section.destroy_all
Seed.new
module Jekyll
  module MP3Filters

    def mp3_length(input)
      "#{input.to_i/60}:#{input.to_i%60}"
    end

    def mp3_size(input)
      sprintf("%1.1f MB", input.to_i/1048576.0)
    end
  end
end

Liquid::Template.register_filter(Jekyll::MP3Filters)

module Jekyll
  module PodcastFilters

    def podcast_length(input)
      "#{input.to_i/60}:#{input.to_i%60}"
    end

    def podcast_size(input)
      sprintf("%1.1f MB", input.to_i/1048576.0)
    end
  end
end

Liquid::Template.register_filter(Jekyll::PodcastFilters)

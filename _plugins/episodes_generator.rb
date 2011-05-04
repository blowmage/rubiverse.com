require 'date'
require 'time'

module Jekyll
  class EpisodesGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.instance_eval do
        def episodes
          @episodes = self.pages.select { |p| p.data['episode'] }.sort_by { |p| 0 - p.data['episode'] }
        end
        alias :old_site_payload :site_payload
        def site_payload
          ret = old_site_payload
          ret['site'].merge!({ 'episodes' => self.episodes })
          ret
        end
      end
      site.episodes.each do |e|
        e.data['published'] = Time.parse e.data['published'].to_s
      end
    end

  end
end
require 'date'
require 'time'

module Jekyll
  class EpisodesGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.instance_eval do
        def episodes
          @episodes = self.pages.select { |p| p.data['podcast'] }.sort_by { |p| 0 - p.data['podcast']['episode'] }
        end
        alias :old_site_payload :site_payload
        def site_payload
          ret = old_site_payload
          ret['site'].merge!({ 'episodes' => self.episodes })
          ret
        end
      end
      site.episodes.each do |e|
        e.data['podcast']['published'] = Time.parse e.data['podcast']['published'].to_s
      end
    end

  end
end
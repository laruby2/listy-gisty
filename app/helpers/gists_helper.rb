module GistsHelper
  def gist_title(gist)
    link = link_to icon('fa-solid', 'external-link'), gist.url, rel: "nofollow"
    github = 'gist.github.com/'
    safe_join [github, gist.name, ' ', link]
  end

  def gist_name(gh_gist)
    if gh_gist['description'].present?
      gh_gist['description']
    else
      gh_gist['files'].first.first
    end
  end
end

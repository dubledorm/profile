module ApplicationHelper
  def resume_download_safe_link(candidate_profile)
    link_to candidate_profile.resume.filename, url_for(candidate_profile.resume)
  rescue StandardError
    ''
  end
end

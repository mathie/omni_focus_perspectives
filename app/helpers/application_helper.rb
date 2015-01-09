module ApplicationHelper
  def li_link_to_active(title, path, *args)
    link = link_to title, path, *args

    if request.path == path
      '<li class="active">'.html_safe + link + '</li>'.html_safe
    else
      '<li>'.html_safe + link + '</li>'.html_safe
    end
  end
end

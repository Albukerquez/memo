module ApplicationHelper
  def alert_for(flash_type) {
    success: 'alert-success',
    error:   'alert-danger',
    alert:   'alert-warning',
    notice:  'alert-info'
  } [flash_type.to_sym] || flash_type.to_s
  end

  # Return the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Memogram'
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def form_image_select(post)
    if post.image_data?
      image_tag post.image_url(:medium), id: 'image-preview', class: 'img-responsive'
    else
      image_tag 'welcome.jpg', id: 'image-preview', class: 'img-responsive'
    end
  end
end

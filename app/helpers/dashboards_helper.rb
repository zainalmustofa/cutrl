module DashboardsHelper
  def icon(name, size=1)
    #icon("camera-retro")
    #<i class="icon-camera-retro"></i> 

    html = "<i class='icon-#{name}' "
    html += "style='font-size:#{size}em' "
    html += "></i>"
    html.html_safe
  end
end

# frozen_string_literal: true
# rubocop:disable Metrics/ModuleLength
module ApplicationHelper
  MISSING_ICON = <<-HTML.freeze
    <svg width="55" height="55" class="cf-icon-missing"
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 55 55">
      <title>missing icon</title>
      <path d="M52.6 46.9l-6 6c-.8.8-1.9 1.2-3 1.2s-2.2-.4-3-1.2l-13-13-13
      13c-.8.8-1.9 1.2-3 1.2s-2.2-.4-3-1.2l-6-6c-.8-.8-1.2-1.9-1.2-3s.4-2.2
      1.2-3l13-13-13-13c-.8-.8-1.2-1.9-1.2-3s.4-2.2 1.2-3l6-6c.8-.8 1.9-1.2
      3-1.2s2.2.4 3 1.2l13 13 13-13c.8-.8 1.9-1.2 3-1.2s2.2.4 3 1.2l6 6c.8.8
      1.2 1.9 1.2 3s-.4 2.2-1.2 3l-13 13 13 13c.8.8 1.2 1.9 1.2 3s-.4 2.2-1.2 3z"/>
    </svg>
  HTML

  FOUND_ICON = <<-HTML.freeze
    <svg width="55" height="55" class="cf-icon-found"
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 50">
      <title>found</title>
      <path d="M57 13.3L29.9 41.7 24.8 47c-.7.7-1.6 1.1-2.5 1.1-.9 0-1.9-.4-2.5-1.1l-5.1-5.3L1
       27.5c-.7-.7-1-1.7-1-2.7s.4-2 1-2.7l5.1-5.3c.7-.7 1.6-1.1 2.5-1.1.9 0 1.9.4 2.5 1.1l11
       11.6L46.8 2.7c.7-.7 1.6-1.1 2.5-1.1.9 0 1.9.4 2.5 1.1L57 8c.7.7 1 1.7 1 2.7 0 1-.4 1.9-1
       2.6z"/>
    </svg>
  HTML

  APPEAL_ICON = <<-HTML.freeze
    <svg width="16" height="16" class="cf-icon-appeal-id"
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 21 21">
    <title>appeal</title>
    <path d="M13.346 2.578h-2.664v-1.29C10.682.585 10.08 0 9.35 0H6.66c-.728 0-1.33.584-1.33
    1.29v1.288H2.663v2.577h10.682V2.578zm-4.02 0H6.66v-1.29h2.665v1.29zm6.685
    3.89V3.234a.665.665 0 0
    0-.678-.656H14v1.29h.68v2.576H6.66v9.046H1.333V3.867h.68v-1.29H.678a.665.665 0 0
    0-.68.657v12.913c0 .365.302.656.68.656h6.006v3.867h9.35l3.996-3.867V6.468h-4.02zm0
    12.378v-2.043h2.112l-2.11 2.043zm2.665-3.356H14.68v3.867H7.992v-11.6h10.682v7.733z"
    fill="#5B616B" fill-rule="evenodd"/></svg>
  HTML

  CLOSE_ICON = <<-HTML.freeze
    <svg style="pointer-events:none;" width="55" height="55" class="cf-icon-close"
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 55 55">
    <title>close</title>
    <path d="M52.6 46.9l-6 6c-.8.8-1.9 1.2-3 1.2s-2.2-.4-3-1.2l-13-13-13 13c-.8.8-1.9 1.2-3
    1.2s-2.2-.4-3-1.2l-6-6c-.8-.8-1.2-1.9-1.2-3s.4-2.2 1.2-3l13-13-13-13c-.8-.8-1.2-1.9-1.2-3s.4-2.2
    1.2-3l6-6c.8-.8 1.9-1.2 3-1.2s2.2.4 3 1.2l13 13 13-13c.8-.8 1.9-1.2 3-1.2s2.2.4 3 1.2l6 6c.8.8
    1.2 1.9 1.2 3s-.4 2.2-1.2 3l-13 13 13 13c.8.8 1.2 1.9 1.2 3s-.4 2.2-1.2 3z"/>
    </svg>
  HTML

  LOADING_ICON_FRONT = <<-HTML.freeze
    <svg
      width="30"
      height="30"
      version="1.1" xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      viewBox="0 0 500 500"
      class="icon-loading-front">

      <path
        opacity="1"
        fill="#d6d7d9"
        fill-opacity="1"
        d = "M250.9,469.4c-13.9,0-25.8-8.1-30.9-21l-29.9-75.3c-2.3-5.8-7.9-9.6-14.2-9.6c-0.8,0-1.6,0.1-2.4,0.2
        l-77,12.4c-1.8,0.3-3.7,0.4-5.5,0.4c-12.7,0-24.1-7.2-29.8-18.9c-5.6-11.6-4.1-25,3.9-35.1l50.2-63.4c4.5-5.7,4.4-13.5-0.1-19.1
        l-49.3-60.5c-8.2-10.1-9.8-23.6-4.3-35.3c5.6-11.8,17-19.1,29.9-19.1c1.7,0,3.4,0.1,5.1,0.4l80,11.7c0.7,0.1,1.5,0.2,2.2,0.2
        c6.3,0,12-4,14.2-9.8l27.8-72.9c5-13,17.2-21.5,31.1-21.5c13.9,0,25.8,8.1,30.9,21l29.8,75.2c2.3,5.8,7.9,9.6,14.2,9.6
        c0.8,0,1.6-0.1,2.4-0.2l77.1-12.4c1.8-0.3,3.7-0.4,5.5-0.4c12.7,0,24.1,7.2,29.8,18.9c5.6,11.6,4.1,25-3.9,35.1l-50.2,63.5
        c-4.5,5.7-4.4,13.5,0.1,19.1L437,323c8.2,10.1,9.8,23.6,4.3,35.3c-5.6,11.8-17,19.1-29.9,19.1c0,0,0,0,0,0c-1.7,0-3.4-0.1-5.1-0.4
        l-80.1-11.8c-0.7-0.1-1.5-0.2-2.2-0.2c-6.3,0-12,4-14.2,9.8l-27.8,73C277.1,460.9,264.8,469.4,250.9,469.4z M175.9,345.4
        c13.7,0,25.9,8.2,30.9,21l29.9,75.3c2.4,6,7.7,9.6,14.2,9.6c5.1,0,11.5-2.6,14.3-9.8l27.8-73c4.9-12.8,17.4-21.5,31.1-21.5
        c1.6,0,3.2,0.1,4.8,0.4l80.1,11.8c0.8,0.1,1.6,0.2,2.4,0.2h0c6.9,0,11.6-4.5,13.6-8.8c2.6-5.4,1.8-11.4-2-16.1l-49.3-60.5
        c-9.9-12.2-10.1-29.3-0.3-41.7l50.2-63.5c5.4-6.8,3-13.5,1.8-16c-2-4.2-6.7-8.7-13.5-8.7c-0.9,0-1.8,0.1-2.7,0.2l-77.1,12.4
        c-1.8,0.3-3.5,0.4-5.3,0.4c-13.7,0-25.9-8.2-30.9-21L266,60.9c-2.4-6-7.7-9.6-14.2-9.6c-5.1,0-11.5,2.6-14.3,9.8L209.8,134
        c-4.9,12.8-17.4,21.5-31.1,21.5c-1.6,0-3.2-0.1-4.8-0.4l-80-11.7c-0.8-0.1-1.6-0.2-2.4-0.2c-6.9,0-11.6,4.5-13.6,8.8
        c-2.6,5.4-1.8,11.4,2,16.1l49.3,60.5c9.9,12.2,10.1,29.3,0.3,41.7l-50.2,63.4c-5.4,6.8-3,13.5-1.8,16c2,4.2,6.7,8.7,13.5,8.7
        c0.9,0,1.8-0.1,2.7-0.2l77-12.4C172.3,345.5,174.1,345.4,175.9,345.4z">
      </path>
    </svg>
  HTML

  LOADING_ICON_BACK = <<-HTML.freeze
    <svg
      width="30"
      height="30"
      version="1.1" xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      viewBox="0 0 500 500"
      class="icon-loading-back">

      <path
        opacity="1"
        fill="#459FD7"
        fill-opacity="1"
        d = "M250.9,469.4c-13.9,0-25.8-8.1-30.9-21l-29.9-75.3c-2.3-5.8-7.9-9.6-14.2-9.6c-0.8,0-1.6,0.1-2.4,0.2
        l-77,12.4c-1.8,0.3-3.7,0.4-5.5,0.4c-12.7,0-24.1-7.2-29.8-18.9c-5.6-11.6-4.1-25,3.9-35.1l50.2-63.4c4.5-5.7,4.4-13.5-0.1-19.1
        l-49.3-60.5c-8.2-10.1-9.8-23.6-4.3-35.3c5.6-11.8,17-19.1,29.9-19.1c1.7,0,3.4,0.1,5.1,0.4l80,11.7c0.7,0.1,1.5,0.2,2.2,0.2
        c6.3,0,12-4,14.2-9.8l27.8-72.9c5-13,17.2-21.5,31.1-21.5c13.9,0,25.8,8.1,30.9,21l29.8,75.2c2.3,5.8,7.9,9.6,14.2,9.6
        c0.8,0,1.6-0.1,2.4-0.2l77.1-12.4c1.8-0.3,3.7-0.4,5.5-0.4c12.7,0,24.1,7.2,29.8,18.9c5.6,11.6,4.1,25-3.9,35.1l-50.2,63.5
        c-4.5,5.7-4.4,13.5,0.1,19.1L437,323c8.2,10.1,9.8,23.6,4.3,35.3c-5.6,11.8-17,19.1-29.9,19.1c0,0,0,0,0,0c-1.7,0-3.4-0.1-5.1-0.4
        l-80.1-11.8c-0.7-0.1-1.5-0.2-2.2-0.2c-6.3,0-12,4-14.2,9.8l-27.8,73C277.1,460.9,264.8,469.4,250.9,469.4z M175.9,345.4
        c13.7,0,25.9,8.2,30.9,21l29.9,75.3c2.4,6,7.7,9.6,14.2,9.6c5.1,0,11.5-2.6,14.3-9.8l27.8-73c4.9-12.8,17.4-21.5,31.1-21.5
        c1.6,0,3.2,0.1,4.8,0.4l80.1,11.8c0.8,0.1,1.6,0.2,2.4,0.2h0c6.9,0,11.6-4.5,13.6-8.8c2.6-5.4,1.8-11.4-2-16.1l-49.3-60.5
        c-9.9-12.2-10.1-29.3-0.3-41.7l50.2-63.5c5.4-6.8,3-13.5,1.8-16c-2-4.2-6.7-8.7-13.5-8.7c-0.9,0-1.8,0.1-2.7,0.2l-77.1,12.4
        c-1.8,0.3-3.5,0.4-5.3,0.4c-13.7,0-25.9-8.2-30.9-21L266,60.9c-2.4-6-7.7-9.6-14.2-9.6c-5.1,0-11.5,2.6-14.3,9.8L209.8,134
        c-4.9,12.8-17.4,21.5-31.1,21.5c-1.6,0-3.2-0.1-4.8-0.4l-80-11.7c-0.8-0.1-1.6-0.2-2.4-0.2c-6.9,0-11.6,4.5-13.6,8.8
        c-2.6,5.4-1.8,11.4,2,16.1l49.3,60.5c9.9,12.2,10.1,29.3,0.3,41.7l-50.2,63.4c-5.4,6.8-3,13.5-1.8,16c2,4.2,6.7,8.7,13.5,8.7
        c0.9,0,1.8-0.1,2.7-0.2l77-12.4C172.3,345.5,174.1,345.4,175.9,345.4z">
      </path>
    </svg>
  HTML

  def svg_icon(name)
    {
      missing: MISSING_ICON,
      found: FOUND_ICON,
      appeal: APPEAL_ICON,
      close: CLOSE_ICON,
      loading_front: LOADING_ICON_FRONT,
      loading_back: LOADING_ICON_BACK
    }[name].html_safe
  end

  def loading_indicator
    content_tag :div, class: "cf-loading-indicator cf-push-right" do
      "Loading #{svg_icon(:loading_front)} #{svg_icon(:loading_back)}".html_safe
    end
  end
end

module ApplicationHelper
  # <div class="form-group form-group-lg">
  #   <%= f.label :title, class: 'col-sm-2 control-label' %>
  #
  #   <div class="col-sm-10 <%= @perspective.errors[:title].present? ? "has-error" : "" %>">
  #     <%= f.text_field :title, class: 'form-control', placeholder: 'Today' %>
  #
  #     <p class="help-block">
  #       Give your perspective a snappy title that succinctly describes what it's
  #       intended to do. This could be, but doesn't have to be, the title you've
  #       given the perspective in OmniFocus.
  #     </p>
  #   </div>
  #
  # </div>
  def omni_text_field(form, field, input_options = {}, &block)
    omni_field(form, field, :text_field, input_options, &block)
  end
  
  def omni_text_area(form, field, input_options, &block)
    omni_field(form, field, :text_area, input_options, &block)
  end

  # <div class="form-group">
  #   <div class="col-sm-offset-2 col-sm-10">
  #     <div class="checkbox">
  #       <%= f.label :sidebar, "#{f.check_box :sidebar} Shown in my sidebar".html_safe %>
  #     </div>
  #
  #     <p class="help-block">
  #       Do you show this view in your sidebar, or is it just for occasional use?
  #     </p>
  #   </div>
  # </div>
  def omni_check_box(form, field, label_text, &block)
    form_group do
      div_classes = [ 'col-sm-10', 'col-sm-offset-2' ]
      div_classes << 'has-error' if form.object.errors[field].present?
      content_tag(:div, class: div_classes) do
        content_tag(:div, class: 'checkbox') do
          field = form.label field, form.check_box(field) + " " + label_text
          append_help_text(field, &block)
        end
      end
    end
  end

  # <div class="form-group">
  #   <div class="col-sm-offset-2 col-sm-10">
  #     <%= f.submit class: 'btn btn-primary' %>
  #     <%= link_to "Cancel", perspectives_path, class: 'btn btn-default' %>
  #   </div>
  # </div>
  def omni_submit_and_cancel(form, cancel_path)
    form_group do
      content_tag(:div, class: 'col-sm-offset-2 col-sm-10') do
        form.submit(class: 'btn btn-primary') + " " +
          link_to('Cancel', cancel_path, class: 'btn btn-default')
      end
    end
  end

  def omni_field(form, field, field_type, input_options = {}, &block)
    form_group do
      label = form.label(field, class: 'col-sm-2 control-label')
      
      div_classes = [ 'col-sm-10' ]
      div_classes << 'has-error' if form.object.errors[field].present?
      label + content_tag(:div, class: div_classes.join(' ')) do
        field = form.send(field_type, field, { class: 'form-control' }.merge(input_options))
        append_help_text(field, &block)
      end
    end
  end
  
  def form_group
    content_tag :div, class: 'form-group' do
      yield
    end
  end
  
  def field_div(form, field, options = {}, help_block, &block)
    offset = options.delete(:offset) || false
    
    div_classes = [ 'col-sm-10' ]
    div_classes << 'col-sm-offset-2' if offset
    div_classes << 'has-error' if form.object.errors[field].present?
    content_tag(:div, class: div_classes.join(' ')) do
      yield + append_help_text(field, help_block)
    end
  end

  def append_help_text(field_html, &block)
    if block_given?
      field_html + content_tag(:p, class: 'help-block') do
        capture(&block)
      end
    else
      field_html
    end
  end
end

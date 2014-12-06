# A form builder which produces fields which conform to the markup that Twitter
# Bootstrap expects. I'm implementing methods on an as-needed basis. So far, it
# has support for text fields, text areas, and check boxes. The +omni_label+
# method is named deliberately not to override the +label+ method provided by
# the base class, since the check box (and others, I'm sure) don't need the
# overridden "default" options.
#
# In addition, the overridden +submit+ button provides both a submit and a
# cancel button -- with the cancel taking the user back to the plural path for a
# new object, or the singular path for a persisted object. This seems like
# sensible default behaviour.
class OmniFormBuilder < ActionView::Helpers::FormBuilder
  [
    :text_field, :text_area
  ].each do |selector|
    class_eval <<-RUBY, __FILE__, __LINE__
      def #{selector}(method, options = {}, &block)
        form_group do
          omni_label(method) + control_div(method: method) do
            field = super method, { class: 'form-control' }.merge(options)
            field + help_text(&block)
          end
        end
      end
    RUBY
  end

  def check_box(method, options = {}, &block)
    label_text = options.delete(:label) || method.to_s.humanize

    form_group do
      control_div(method: method, offset: true) do
        @template.content_tag(:div, class: 'checkbox') do
          field = super method, options
          label(method, field.html_safe + ' ' + label_text)
        end + help_text(&block)
      end
    end
  end

  def radio_button(method, tag_value, options = {}, &block)
    label_text = options.delete(:label) || tag_value.to_s.humanize

    form_group do
      control_div(method: method, offset: true) do
        @template.content_tag(:div, class: 'radio') do
          field = super method, tag_value, options
          label(method, field.html_safe + ' ' + label_text)
        end + help_text(&block)
      end
    end
  end

  def omni_label(method, *args)
    options = args.extract_options!
    label method, *args, { class: 'col-sm-2 control-label' }.merge(options)
  end

  def submit
    form_group do
      control_div(offset: true) do
        submit = super(class: 'btn btn-primary')
        cancel = @template.link_to('Cancel', @template.polymorphic_path(object), class: 'btn btn-default')

        submit + ' ' + cancel
      end
    end
  end

  private

  def form_group
    @template.content_tag :div, class: 'form-group' do
      yield
    end
  end

  def control_div(options = {}, &block)
    method = options.delete(:method)

    classes = ['col-sm-10']
    classes << 'col-sm-offset-2' if options[:offset]
    classes << 'has-error' if method.present? && object.errors[method].present?

    @template.content_tag(:div, class: classes.join(' '), &block)
  end

  def help_text(&block)
    if block_given?
      @template.content_tag(:p, class: 'help-block') do
        @template.capture(&block)
      end
    else
      ''
    end
  end
end

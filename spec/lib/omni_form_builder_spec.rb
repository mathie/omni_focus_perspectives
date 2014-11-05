require 'rails_helper'

RSpec.describe OmniFormBuilder do
  let(:model)    { double('model', errors: {}) }
  let(:template) { double('template') }
  subject { OmniFormBuilder.new 'model', model, template, {} }

  before(:each) do
    allow(template).to receive(:content_tag) do |&block|
      "<div>#{block.call}</div>"
    end
    allow(template).to receive(:label).and_return('<label>')
  end

  it 'can be instantiated' do
    expect { subject }.not_to raise_error
  end

  it 'preserves the existing behaviour of normal labels' do
    subject.label(:field, 'Custom label')

    expect(template).to have_received(:label).with(
      'model',
      :field,
      'Custom label',
      object: model
    )
  end

  it 'generates a label with the correct HTML classes' do
    subject.omni_label(:field)

    expect(template).to have_received(:label).with(
      'model',
      :field,
      {
        class: 'col-sm-2 control-label'
      },
      object: model
    )
  end

  describe 'generating a text field' do
    before(:each) do
      allow(template).to receive(:text_field).and_return('<input>')
    end

    it 'generates the correct surrounding div' do
      subject.text_field(:field)

      expect(template).to have_received(:content_tag).
        with(:div, class: 'form-group')
    end
    
    it 'generates the correct label' do
      subject.text_field(:field)

      expect(template).to have_received(:label).with(
        'model',
        :field,
        {
          class: 'col-sm-2 control-label'
        },
        object: model
      )
    end
    
    describe 'generating the correct div around the input' do
      it 'when there are no errors' do
        subject.text_field(:field)

        expect(template).to have_received(:content_tag).
          with(:div, class: 'col-sm-10')
      end
      
      it 'when there is an error on the field' do
        allow(model).to receive(:errors) do
          { field: [ 'error message' ] }
        end

        subject.text_field(:field)

        expect(template).to have_received(:content_tag).
          with(:div, class: 'col-sm-10 has-error')
      end
    end

    it 'generates the correct input' do
      subject.text_field(:field)

      expect(template).to have_received(:text_field).with(
        'model',
        :field,
        class: 'form-control',
        object: model
      )
    end

    it 'spits out all the generated fields, nested correctly' do
      result = subject.text_field(:field)
      expect(result).to eq('<div><label><div><input></div></div>')
    end
  end

  describe 'generating a text area' do
    before(:each) do
      allow(template).to receive(:text_area).and_return('<input>')
    end

    it 'generates the correct surrounding div' do
      subject.text_area(:field)

      expect(template).to have_received(:content_tag).
        with(:div, class: 'form-group')
    end
    
    it 'generates the correct label' do
      subject.text_area(:field)

      expect(template).to have_received(:label).with(
        'model',
        :field,
        {
          class: 'col-sm-2 control-label'
        },
        object: model
      )
    end
    
    describe 'generating the correct div around the input' do
      it 'when there are no errors' do
        subject.text_area(:field)

        expect(template).to have_received(:content_tag).
          with(:div, class: 'col-sm-10')
      end
      
      it 'when there is an error on the field' do
        allow(model).to receive(:errors) do
          { field: [ 'error message' ] }
        end

        subject.text_area(:field)

        expect(template).to have_received(:content_tag).
          with(:div, class: 'col-sm-10 has-error')
      end
    end

    it 'generates the correct input' do
      subject.text_area(:field)

      expect(template).to have_received(:text_area).with(
        'model',
        :field,
        class: 'form-control',
        object: model
      )
    end

    it 'spits out all the generated fields, nested correctly' do
      result = subject.text_area(:field)
      expect(result).to eq('<div><label><div><input></div></div>')
    end
  end

  describe 'generating a check box' do
    before(:each) do
      allow(template).to receive(:check_box).and_return('<input>')
      allow(template).to receive(:label) do |name, field, label, options|
        "<label>#{label}</label>"
      end
    end

    it 'generates the correct surrounding div' do
      subject.check_box(:field)

      expect(template).to have_received(:content_tag).
        with(:div, class: 'form-group')
    end
    
    it 'generates the correct label' do
      subject.check_box(:field)

      expect(template).to have_received(:label).with(
        'model',
        :field,
        '<input> Field',
        object: model
      )
    end
    
    describe 'generating the correct div around the input' do
      it 'when there are no errors' do
        subject.check_box(:field)

        expect(template).to have_received(:content_tag).
          with(:div, class: 'col-sm-10 col-sm-offset-2')
      end
      
      it 'when there is an error on the field' do
        allow(model).to receive(:errors) do
          { field: [ 'error message' ] }
        end

        subject.check_box(:field)

        expect(template).to have_received(:content_tag).
          with(:div, class: 'col-sm-10 col-sm-offset-2 has-error')
      end
    end

    it 'generates the correct input' do
      subject.check_box(:field)

      expect(template).to have_received(:check_box).with(
        'model',
        :field,
        { object: model }, '1', '0'
      )
    end

    it 'spits out all the generated fields, nested correctly' do
      expected = '<div><div><div><label><input> Field</label></div></div></div>'
      result = subject.check_box(:field)

      expect(result).to eq(expected)
    end
  end

  describe 'generating a submit button' do
    before(:each) do
      allow(template).to receive(:submit_tag) { '<input>' }
      allow(template).to receive(:link_to) { '<a>' }
      allow(template).to receive(:polymorphic_path) { '/models' }
      allow(model).to receive(:persisted?) { false }
    end

    it 'generates the correct surrounding div' do
      subject.submit

      expect(template).to have_received(:content_tag).
        with(:div, class: 'form-group')
    end
  
    it 'generates the correct div around the control' do
      subject.submit

      expect(template).to have_received(:content_tag).
        with(:div, class: 'col-sm-10 col-sm-offset-2')
    end

    describe 'when the model has not been persisted' do
      it 'generates the correct input' do
        subject.submit

        expect(template).to have_received(:submit_tag).with(
          'Create Model',
          class: 'btn btn-primary'
        )
      end
      
      it 'generates the cancel link button' do
        subject.submit
        
        expect(template).to have_received(:link_to).with(
          'Cancel',
          '/models',
          class: 'btn btn-default'
        )
      end
    end

    describe 'when the model has been persisted' do
      before(:each) do
        allow(model).to receive(:persisted?) { true }
        allow(template).to receive(:polymorphic_path) { '/models/1' }
      end

      it 'generates the correct input' do
        subject.submit

        expect(template).to have_received(:submit_tag).with(
          'Update Model',
          class: 'btn btn-primary'
        )
      end

      it 'generates the cancel link button' do
        subject.submit
        
        expect(template).to have_received(:link_to).with(
          'Cancel',
          '/models/1',
          class: 'btn btn-default'
        )
      end
    end

    it 'spits out all the generated fields, nested correctly' do
      expected = '<div><div><input> <a></div></div>'
      result = subject.submit

      expect(result).to eq(expected)
    end
  end
end
RSpec.describe Web::Views::Books::New, type: :view do
  let(:exposures) { Hash[params: params, format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  context 'when params not contains error' do
    let(:params) { OpenStruct.new(valid?: true, error_messages: []) }

    it 'exposes #format' do
      expect(view.format).to eq exposures.fetch(:format)
    end
  end

  context 'when params contains errors' do
    let(:params) { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Author must be filled']) }

    it 'displays list of errors' do
      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('Title must be filled')
      expect(rendered).to include('Author must be filled')
    end
  end
end

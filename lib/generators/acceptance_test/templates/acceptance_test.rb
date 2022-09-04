require 'rails_helper'
require 'rspec_api_documentation/dsl'
< % module_namespacing do
  -%>
<% model_name = class_name.split("::").last %>
  < % path2 = singular_table_name %>
<% path = "api/v1/#{class_name.pluralize.gsub('::', '/').underscore}" %>
  resource "<%= model_name.pluralize %>", type: :request do

    explanation "<%= model_name.pluralize %> resource"
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    let!(:user) { create(:user_with_projects) }
    let(:admin) { create(:admin) }
    let(:vip) { create(:vip) }

    before do
      auth_header = generate_auth_header(user)
      header "uid", auth_header["uid"]
      header "client", auth_header["client"]
      header "access-token", auth_header["access-token"]
    end

    get "<%= path %>/", :document => [:private] do
      context '200' do
        example_request 'Getting a list of all <%= model_name.pluralize %>' do
          expect(status).to eq(200)
        end
      end
    end
  end
  < %
end - %>

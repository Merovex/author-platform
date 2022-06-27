require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'should get atom' do
    get xml_atom_url
    assert_response :success
  end

  test 'should get sitemap' do
    get xml_sitemap_url
    assert_response :success
  end
end

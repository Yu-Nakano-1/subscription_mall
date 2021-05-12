##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'ConnectionPolicy' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.connection_policies.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/ConnectionPolicies',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:36Z",
          "url": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "targets": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Targets"
          }
      }
      ]
    ))

    actual = @client.voice.v1.connection_policies.create()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.connection_policies('NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/ConnectionPolicies/NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:37Z",
          "url": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "targets": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Targets"
          }
      }
      ]
    ))

    actual = @client.voice.v1.connection_policies('NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.connection_policies.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://voice.twilio.com/v1/ConnectionPolicies',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://voice.twilio.com/v1/ConnectionPolicies?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://voice.twilio.com/v1/ConnectionPolicies?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "connection_policies"
          },
          "connection_policies": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "friendly_name",
                  "date_created": "2020-03-18T23:31:36Z",
                  "date_updated": "2020-03-18T23:31:37Z",
                  "url": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "targets": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Targets"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.voice.v1.connection_policies.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://voice.twilio.com/v1/ConnectionPolicies?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://voice.twilio.com/v1/ConnectionPolicies?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "connection_policies"
          },
          "connection_policies": []
      }
      ]
    ))

    actual = @client.voice.v1.connection_policies.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.connection_policies('NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://voice.twilio.com/v1/ConnectionPolicies/NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "updated_name",
          "date_created": "2020-03-18T23:31:36Z",
          "date_updated": "2020-03-18T23:31:37Z",
          "url": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "targets": "https://voice.twilio.com/v1/ConnectionPolicies/NYaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Targets"
          }
      }
      ]
    ))

    actual = @client.voice.v1.connection_policies('NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.voice.v1.connection_policies('NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://voice.twilio.com/v1/ConnectionPolicies/NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.voice.v1.connection_policies('NYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end
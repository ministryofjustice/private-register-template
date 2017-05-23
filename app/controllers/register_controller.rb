class RegisterController < ApplicationController
  # {  
  #    "domain":"register.gov.uk",
  #    "total-records":199,
  #    "total-entries":206,
  #    "register-record":{  
  #       "fields":[  
  #          "country",
  #          "name",
  #          "official-name",
  #          "citizen-names",
  #          "start-date",
  #          "end-date"
  #       ],
  #       "registry":"foreign-commonwealth-office",
  #       "text":"British English-language names and descriptive terms for countries",
  #       "phase":"beta",
  #       "register":"country",
  #       "entry-timestamp":"2016-08-04T14:45:41Z",
  #       "key":"country",
  #       "index-entry-number":"2",
  #       "entry-number":"2"
  #    },
  #    "last-updated":"2017-03-29T14:22:30Z"
  # }
  def show
    respond_with Register.meta_data
  end

  def download
  end
end
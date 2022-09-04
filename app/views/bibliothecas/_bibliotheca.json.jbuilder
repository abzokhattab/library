json.extract! bibliotheca, :id
json.merge! bibliotheca.attributes.except("_id")
json.link bibliothecas_url(bibliotheca, format: :json)
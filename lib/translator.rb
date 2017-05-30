# require modules here
require "yaml"
require "pry"

def load_library(path)
  raw_hash = YAML.load_file(path)
  new_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  raw_hash.each { |meaning, emoticons|
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
    emoticons.each { |emoticon|
      new_hash["get_meaning"][emoticon] = meaning
    }
  }
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  translator = load_library(file_path)
  result = translator["get_emoticon"][emoticon]
  if result != nil
    return result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  translator = load_library(file_path)
  result = translator["get_meaning"][emoticon]
  if result != nil
    return result
  else
    return "Sorry, that emoticon was not found"
  end
end

# get_japanese_emoticon("./lib/emoticons.yml", "=D")

DEBUG_LOGGER = Logger.new(File.join(Rails.root, 'log', 'debug.log'))
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

I18n.default_locale = "fr"
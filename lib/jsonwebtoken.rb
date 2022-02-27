class JsonWebToken

  def self.decode(token)
    body = JWT.decode(token, "07af1e722221fc66161ff1c236e928184f34fd99146b19df1b7040ca21baf5f62f36eed0e3bb146abed65d48041120406285c7ea14ed438ff01e2aca70e917af")[0]
    HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::VerificationError => e
      raise ExceptionHandler::ExpiredSignature, e.message
    rescue JWT::DecodeError, JWT::VerificationError => e
      raise ExceptionHandler::DecodeError, e.message
  end
end

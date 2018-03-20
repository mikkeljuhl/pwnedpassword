require "net/http"
require "digest"

class HIBPPasswordChecker
  # Example usage:
  #
  # HIBPPasswordChecker.pwned?("password")
  # => true
  # HIBPPasswordChecker.pwned?("3WJwP#cnFoUQ.9oPpc2Taivvgea+Qz2*egY")
  # => false

  def self.pwned?(password)
    hash = hash_password(password)
    pwned_hashes = parse_response(pwned_passwords_from_hash(hash))
    have_i_been_pwned(hash, pwned_hashes)
  end

  private

  def self.have_i_been_pwned(hash, pwned_passwords)
    pwned = pwned_passwords.select {|hashed| hash.upcase == (hash[0..4] + hashed[0..34]).upcase}
    !pwned.size.zero?
  end

  def self.pwned_passwords_from_hash(hash)
    shortened_hash = hash[0..4]
    uri = URI("https://api.pwnedpasswords.com/range/#{shortened_hash}")
    res = Net::HTTP.get_response(uri)
    res.body if res.is_a?(Net::HTTPSuccess)
  end

  def self.parse_response(response_body)
    response_body.split("\r\n")
  end

  def self.hash_password(password)
    ::Digest::SHA1.hexdigest(password)
  end
end
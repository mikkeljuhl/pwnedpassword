require_relative "../lib/hibp_password_checker"

RSpec.describe HIBPPasswordChecker do

  subject { HIBPPasswordChecker }

  it "correctly sha1 a password" do
    expect(subject.send :hash_password, "hey").to eq("7f550a9f4c44173a37664d938f1355f0f92a47a7")
  end

  it "gets a response from pwnedpasswords" do
    expect(subject.send :pwned_passwords_from_hash, "7f550a9f4c44173a37664d938f1355f0f92a47a7").not_to eq (nil)
  end

  it "parses the response correctly" do
    sample_response = "0006169CD78DF3BDB196709CE6F0AAD9485:2\r\n00542F2CC132CCA13C487DE98A1B1D88D11:3\r\n005F97959C52D0FBED04EA99C697073C2F1:1\r\n00E8A33A860DF59636AA434AC562D4901A9:1\r\n0154FEDD9195C2BC6914FAE7CFE2490D33B:2\r\n01DE985D846CC699AF2341F8C91AB0C466C:4\r\n01FC90C1CA6090BD279708AB163536F4D3E:2\r\n035E8D2123DB9FF3C2004A25FE9AC0482BC:4\r\n03804EE003966D9CE44F2CDF9E426D83CB8:2\r\n0403FD2601690FE3D9A58219AC7180E6B96:1\r\n04A93503E0A4E793B062E1FA9DC450A9450:1"
    expect((subject.send :parse_response, sample_response).is_a?(Array)).to eq true
    expect((subject.send :parse_response, sample_response)[0]).to eq "0006169CD78DF3BDB196709CE6F0AAD9485:2"
    expect((subject.send :parse_response, sample_response).last).to eq "04A93503E0A4E793B062E1FA9DC450A9450:1"
  end

  it "returns true if we have been pwned" do
    hashes_of_pwned = ["00E8A33A860DF59636AA434AC562D4901A9:2", "00542F2CC132CCA13C487DE98A1B1D88D11:3"]
    hash = "0006100E8A33A860DF59636AA434AC562D4901A9"
    expect(subject.send :have_i_been_pwned, hash, hashes_of_pwned).to eq true
  end

  context "returns false if we haven't been pwned" do
    it "array of size 1" do
      hashes_of_pwned = ["0006169CD78DF3BDB196709CE6F0AAD9481:2"]
      hash = "0006169CD78DF3BDB196709CE6F0AAD9485"
      expect(subject.send :have_i_been_pwned, hash, hashes_of_pwned).to eq false
    end

    it "array of size 2" do
      hashes_of_pwned = ["0006169CD78DF3BDB196709CE6F0AAD9481:2", "00542F2CC132CCA13C487DE98A1B1D88D11:3"]
      hash = "0006169CD78DF3BDB196709CE6F0AAD9485"
      expect(subject.send :have_i_been_pwned, hash, hashes_of_pwned). to eq false
    end
  end

  it "the password: 'password' has been pwned" do
    expect(HIBPPasswordChecker.pwned?'password').to eq true
  end

end

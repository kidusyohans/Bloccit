describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
         expect(good_v.valid?).to eq(true) 
         expext(bad_v.valid?).to eq(true)
         expect(no_v.valid?).to eq(false)
      end
    end
  end
end
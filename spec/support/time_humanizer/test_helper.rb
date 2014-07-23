module TimeHumanizer
  module TestHelper
    def conversion_with(opts = {})
      context opts[:value].to_s do
        let(:value) { opts[:value] }
        if opts[:raises]
          it { expect{ subject }.to raise_error opts[:raises] }
        else
          it { is_expected.to eq opts[:expects] }
        end
      end
    end
  end
end

require 'rspec'
require 'code.rb'

describe "#my_unique" do
    let(:arr) { [1, 2, 1, 3, 3] }

    it "returns unique elements in the order they first appeared" do
        expect(arr.my_unique).to eq([1, 2, 3])
    end

    it "does not modify original array" do
        arr.my_unique
        expect(arr).to eq([1, 2, 1, 3, 3])
    end

    it "accepts an empty array input" do
        test_array = [].my_unique
        expect(test_array).to eq([])
    end

    it "raises error if call on a string object" do
        input = "Laura"
        
        expect { (input.my_unique) }.to raise_error("Must call on array object")
    end

end

describe "#two_sum" do
    let(:arr) { [-1, 0, 2, -2, 1] }
    
    it "returns all element index pairs that sum to 0" do
        expect(arr.two_sum).to eq( [[0, 4], [2, 3]] )
    end

    it "returns empty array when no elements sum to 0" do
        no_sum_zero_array = [2,3,4,5]

        expect(no_sum_zero_array.two_sum).to eq([])
    end
end

describe "#my_transpose" do
    let(:rows) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ] }
    
    let(:cols) { [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
    ] }

    it "converts square matrices between row-oriented and column-oriented representations" do
        expect(rows.my_transpose).to eq(cols)
    end
end

describe "#stock_picker" do
    let(:prices) { [13,5,2,8,10,11,9] }

    it "takes array of stock prices and outputs the most profitable pair of days to buy then sell" do
        expect(prices.stock_picker).to eq([2, 5])
    end
end
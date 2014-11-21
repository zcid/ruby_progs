class Matrix
  def self.rotate(matrix)
    y_len = matrix.length
    x_len = matrix[0].length

    new_matrix = Array.new(x_len) {|i| Array.new(y_len) {|i| 0}}

    (0..(y_len - 1)).each do |y|
      (0..(x_len - 1)).each do |x|
        binding.pry
        new_matrix[(x_len - 1 - x)][y] = matrix[y][x]
      end
    end

    return new_matrix
  end
end

require 'colorize'

class Board
  attr_accessor :board

  def initialize
    @board =
    [
      [Piece.new(:rook), Piece.new(:knight), Piece.new(:bishop), Piece.new(:queen), Piece.new(:king), Piece.new(:bishop), Piece.new(:knight), Piece.new(:rook)],
      [Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn)],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new,NullPiece.new],
      [Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn),Piece.new(:pawn)],
      [Piece.new(:rook), Piece.new(:knight), Piece.new(:bishop), Piece.new(:queen), Piece.new(:king), Piece.new(:bishop), Piece.new(:knight), Piece.new(:rook)]
    ]
  end

  def move_piece(start_pos, end_pos)
    start0 = start_pos[0]
    start1 = start_pos[1]
    end0 = end_pos[0]
    end1 = end_pos[1]

    if @board[start0][start1].is_a? NullPiece
      raise "Cannot move a Nullpiece (ITS NOT A PIECE)"
    elsif !(@board[end0][end1].is_a? NullPiece)
      raise "Cannot move to end point: existing piece"
    elsif (start0 < 0 || start0 > 7) || (start1 < 0 || start1 > 7) || (end0 < 0 || end0 > 7) || (end1 < 0 || end1 > 7)
      raise "Cannot access position off chess board!"
    end

    @board[end0][end1] = @board[start0][start1]
    @board[start0][start1] = NullPiece.new


  end

end

class Piece
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def inspect
    p "type: #{@type}"
  end
end

class NullPiece < Piece

  def initialize
  end

  def inspect
    p "nullpiece"
  end
end

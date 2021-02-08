
module Display

    def chess_board

    end

    def start_message
        <<-HEREDOC
        Let's play Chess!

        input 1 to play with computer,
        input 2 to play with human,
        input 3 to play a saved game.

        HEREDOC
    end

    def choose_color
        <<-HEREDOC

        Please input w to be WHITE, b to be BLACK.

        HEREDOC
    end

    def select_chess
        <<-HEREDOC

        Please input the co-ordiantes of your choice,
        example: a2

        HEREDOC
    end

    def move_chess
        <<-HEREDOC

        Please input where you want to move,
        example: a4

        HEREDOC
    end

    def end_message
        <<-HEREDOC

        Continue to play?

        input 1 to start a new game
        input 2 to load a saved game

        HEREDOC
    end

end
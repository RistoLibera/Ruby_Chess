
module Display
    def start_message
        <<-HEREDOC

        Let's play Chess!

        input 1 to play with computer,
        input 2 to play with human,
        input 3 to play a saved game.

        HEREDOC
    end

    def input_error
        <<-HEREDOC

        Input Error!
        Please input again

        HEREDOC
    end

    def player_one_prompt
        <<-HEREDOC

        Please input player one's name,
        which must be longer than one character.

        HEREDOC
    end

    def player_two_prompt
        <<-HEREDOC

        Please input player two's name, or computer's,
        which must be longer than one character.

        HEREDOC
    end


    def black_or_white
        <<-HEREDOC

        Please input w to be WHITE, b to be BLACK.

        HEREDOC
    end

    def turn_message(count, name)
        <<-HEREDOC

        Turn Number #{count}
        #{name} to move

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

        Please input where you want to move, red block is where you could move
        example: a4

        HEREDOC
    end

    def end_message
        <<-HEREDOC

        Play again?

        input 1 to start a new game
        input 2 to load a saved game

        HEREDOC
    end

end
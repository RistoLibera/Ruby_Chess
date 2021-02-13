
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

    def selection_hint(round_count, name, faction)
        <<-HEREDOC

        Turn Number #{round_count}, (#{name}) to move.
        Please input the co-ordiantes of #{faction} chess,
        example: a2

        HEREDOC
    end

    def invalid_selection
        <<-HEREDOC

        Selected chess can not be moved!
        HEREDOC
    end

    def movement_hint(round_count, name)
        <<-HEREDOC

        Turn Number #{round_count}, (#{name}) to move.
        Please input where you want to move, red block is where you could move,
        and chess having no potential movement couldn't be selected!
        example: a4

        HEREDOC
    end

    def game_over(round_count)
        <<-HEREDOC

        Within #{round_count} rounds a winner arises!
        
        Play again?

        input 1 to start a new game
        input 2 to load a saved game

        HEREDOC
    end

end
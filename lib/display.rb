
module Display

    def show_board(board)
        board.each_with_index do |columns, row_index|
            print "\e[36m  #{8 - row_index} \e[0m"
            columns.each_with_index do |co_ord, column_index|
                update_borad(co_ord, column_index, row_index) 
            end
            puts ""
        end
        puts "\e[36m    a b c d e f g h \e[0m"
    end

    def update_borad(co_ord, column_index, row_index)
        background = get_background(column_index, row_index)
        print "\e[#{background}#{co_ord.push_unicode} \e[0m" unless co_ord.nil?
        print "\e[#{background}m  \e[0m" if co_ord.nil?
    end

    def get_background(column_index, row_index)
        if row_index % 2 == 0
            return "47" if column_index % 2 == 0
            return "40" if column_index % 2 == 1
        elsif row_index % 2 == 1
            return "40" if column_index % 2 == 0
            return "47" if column_index % 2 == 1
        else
            puts "Error!"
        end
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
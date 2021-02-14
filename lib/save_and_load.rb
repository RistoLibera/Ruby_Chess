require "yaml"

module GameData
    def save_game(instance)
        puts "\nPlesase input a filename"
        filename = gets.chomp.to_s
        dump = YAML.dump(instance)
        Dir.mkdir 'save' unless Dir.exist? 'save'
        if File.exist?("save/#{filename}.yaml")
            puts "Existed filename, unsuccessiful saving."
        else
            File.write(File.open("save/#{filename}.yaml", "w+"), dump)
            puts "Saved!"
        end
    end

    def load_game
        puts ""
        files = Dir.glob("save/*")
        length = files.length

        length.times do |i|
            files[i] = files[i].slice(5, files[i].length)
            puts files[i]
        end
        puts "\nAll the saving is here.\n" + "Please input file's name."
        input = gets.chomp.to_s
        until files.include?(input + ".yaml") do
            puts "\nPlease input again!"
            input = gets.chomp.to_s
        end
        filename = "save/" + input + ".yaml"
        old_game = YAML.load(File.read(filename))
        old_game.play_turn
    end
end


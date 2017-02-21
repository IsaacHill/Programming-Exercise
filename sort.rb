class NameSorter
    def sort_names(entry_array) #sort an array of names
        entry_array = entry_array.sort_by{ |word| word.downcase }
        entry_array.each{|x| puts x}
    end
    def open_file(file_to_open) #opens a file
        contents = File.readlines(file_to_open)
    end
    def save_file(array_to_save, location) #saves array to location
        File.open(location,"w") do |line|
            array_to_save.each { |x| line.print(x) }
        end
    end
    def sort_file
        input = ARGV
        if input.length != 1
            return puts "Incorrect Args"
        end
        fileName = input[0].split('.txt')[0]
        save_file(sort_names(open_file(fileName+'.txt')), fileName+'-sorted.txt')
        puts "Finished: created "+fileName+"-sorted.txt"
    end
end

if __FILE__ == $0
    ns = NameSorter.new
    ns.sort_file
end

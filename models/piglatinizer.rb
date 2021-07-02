class PigLatinizer

    def piglatinize(input)
        result = ""
        input.split(" ").each{ |word|
            temp_result = self.separate(word).last + self.separate(word)[0]
            
            if (self.is_vowel(word[0]))
                temp_result = temp_result + "way"
            else
                temp_result = temp_result + "ay"  
            end
            result = result + temp_result + " "
        }

        #binding.pry
        return result.strip
    end

    def separate(word)
        characters = word.split("")
        init_cons = ""
        remaining = ""
        collection = Array.new
        index = 0

        characters.each do |character|
            if (!self.is_vowel(character))
                init_cons += character
                index += 1
            else
                remaining = word[index...word.length]
                break
            end
        end

        collection << init_cons
        collection << remaining

        return collection
    end

    def is_vowel(letter)
        if (letter == "a" ||
            letter == "e" || 
            letter == "i" || 
            letter == "o" || 
            letter == "u" ||
            letter == "A" ||
            letter == "E" || 
            letter == "I" || 
            letter == "O" || 
            letter == "U" )
            return true
        else
            return false
        end
    end
end

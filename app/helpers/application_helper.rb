module ApplicationHelper

    #Two recusive methods, the first acts like .map the other does what .index does 
    def map_recur(arr, idx=0, acc=[], &findBy)
        return acc if idx == arr.count
        if findBy.call(arr[idx])
            acc << arr[idx]
        end
        map_recur(arr, idx + 1, acc, &findBy)
    end

    def index_of_recur(arr, toFind, idx=0)
        return arr[count] == toFind ? count : index_of_recur(arr, toFind, idx += 1)
    end
    
end

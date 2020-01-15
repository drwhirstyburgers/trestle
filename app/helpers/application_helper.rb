module ApplicationHelper

    def map_recur(arr, idx=0, acc=[], &findBy)
        return acc if idx == arr.count
        if findBy.call(arr[idx])
          acc << arr[idx]
        end
        find_by_condition_recur(arr, idx + 1, acc, &findBy)
    end

    def index_of(arr, toFind, count=0)
        return arr[count] == toFind ? count : find_index_recur(arr, toFind, count += 1)
    end
end

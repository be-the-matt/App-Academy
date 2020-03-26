def my_reject(arr, &prc)
    arr.select { |ele| prc.call(ele) == false }
end

def my_one?(arr, &prc)
    num_true = arr.select { |ele| prc.call(ele) }
    return true if num_true.length == 1
    false
end

def hash_select(hash, &prc)
    new_hash = Hash.new
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    arr.select do |ele|
        if ( prc1.call(ele) == true && prc2.call(ele) == true )
            false
        else
            prc1.call(ele) || prc2.call(ele)
        end
    end
end

def proc_count(val, arr)
    true_procs = arr.select do |prc|
        prc.call(val)
    end
    true_procs.length
end
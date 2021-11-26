# # directions : 
#     # left_to_right: [i, j] --> [i, j+1] = [i, j] + [0, 1]
#     # top_to_bottom: [i, j] --> [i+1, j] = [i, j] + [1, 0]
#     # right_to_left: [i, j] --> [i, j-1] = [i, j] + [0, -1]
#     # bottom_to_top: [i, j] --> [i-1, j] = [i, j] + [-1, 0]
function spiralMat(nRow::Int, nCol::Int)
    if nRow ≤ 0 || nCol ≤ 0
        return error("The number of cols and rows must be positive!")
    end
    mat = zeros(Int, nRow, nCol)
    matSize = nRow * nCol
    matEntry = 1
    nextI, nextJ = 1, 1
    mat[nextI, nextJ] = 1
    Δs = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    direction = 1
    δ = Δs[direction]
    # while matEntry ≤ matSize
    for matEntry = 1:matSize
        # nextI += δ[1]
        # nextJ += δ[2]
        # if (nextI == nRow + 1) || (nextJ == nCol + 1) || (mat[nextI, nextJ] > 0)
        if (nextI == nRow + 1) || (nextJ == nCol + 1) || (mat[nextI, nextJ] > 0)
            direction = (direction + 1) % 4
            # δ = Δs[direction]
        end
        δ = Δs[direction]
        nextI += δ[1]
        nextJ += δ[2]
        mat[nextI, nextJ] = matEntry
    end
    return mat
end

using Plots
using LinearAlgebra
using Random
using DelimitedFiles
using CSV, DataFrames


# 18.a
function diagSum(mat::AbstractMatrix)
    nRows, nCols = size(mat)
    if nRows != nCols
        return print("Error: Matrix input must be a square matrix")
    else
        return sum([mat[i, i] for i = 1:nRows])
    end
end

# 18.b
function upperRightSum(mat::AbstractMatrix)
    nRows, nCols = size(mat)
    return sum([mat[i, j] for i = 1:nRows for j = i+1:nCols])
end

# 18.c
# sum(A, dims=1)
function colSum(matrix::AbstractMatrix)
    nCols = size(matrix, 2)
    colSum = zeros(Int, nCols)
    for j = 1:nCols
        colSum[j] += sum(matrix[:, j])
    end
    return colSum
end

# sum(A, dims=2)
function rowSum(matrix::AbstractMatrix)
    nRows = size(matrix, 1)
    rowSum = zeros(Int, nRows)
    for i = 1:nRows
        rowSum[i] += sum(matrix[i, :])
    end
    return rowSum
end
# 19.
function pascalTriangle(side::Integer)
    size = side + 1
    pascalMat = zeros(Int, size, size)
    for i = 1:size
        for j = 1:i
            if j in [1, i]
                pascalMat[i, j] = 1
            else
                pascalMat[i, j] = pascalMat[i-1, j] + pascalMat[i-1, j-1]
            end
        end
    end
    return pascalMat
end

# 20.

# 21.
# function escapeVelocity(z0, c, N)
function escapeVelocity(initialComplex::Complex, contantComplex::Complex, maxAlow::Int, absMax = 2.0)
    z_n, c = initialComplex, contantComplex
    escapeV = 0
    while abs(z_n) ≤ 2 && escapeV ≤ maxAlow
        z_n = z_n^2 + c
        escapeV += 1
    end
    return escapeV
end

function julia(zMax, c::Complex, maxAlow::Int, widthImage = 500::Int, heightImage = 500::Int)
    Z_re = -zMax:(2zMax/widthImage):zMax
    Z_im = -zMax:(2zMax/heightImage):zMax
    juliaMat = zeros(widthImage + 1, heightImage + 1)
    for i = 1:widthImage + 1
        for j = 1:heightImage + 1
            juliaMat[i, j] = escapeVelocity(complex(Z_re[i], Z_im[j]), c, maxAlow)
        end
    end
    return juliaMat
end

function juliaImage(zMax, c::Complex, maxAlow::Int)
    juliaMat = julia(zMax, c, maxAlow)
    return heatmap(juliaMat)
end

# c = complex(-0.297491, 0.641051)

# zMax1 = 1.0
# N1 = 100
# juliaImage(zMax1, c, N1)
# savefig("julia-set-1.png")

# zMax2 = 0.35
# N2 = 250
# juliaImage(zMax2, c, N2)
# savefig("julia-set-2.png")

# 22.
function mulMat(A::AbstractMatrix, B::AbstractMatrix)
    nRowsA, nColsA = size(A)
    nRowsB, nColsB = size(B)
    if nColsA != nRowsB
        return print("Error: The Cols of the first matrix must be equal the Rows of the second matrix")
    end
    # A ∈ M(m*n, F), B ∈ M(n*p, F)
    mulMat = zeros(nRowsA, nColsB)
    for i = 1:nRowsA
        for j = 1:nColsB
            for k = 1:nColsA
                mulMat[i, j] += A[i, k]*B[k, j]
            end
        end
    end
    return mulMat
end

# A = rand(1:10, 2, 3)
# B = rand(1:10, 3, 4)
# A*B == mulMat(A, B)
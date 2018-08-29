function PolyShape(body::Body, verts::Array{Vect}, radius::Real)
    shape_ptr = ccall(Libdl.dlsym(libchipmunk, :cpPolyShapeAlloc), Ptr{Cvoid}, ())
    PolyShape(ccall(Libdl.dlsym(libchipmunk, :cpPolyShapeInitRaw), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Int32, Ptr{Vect}, Cdouble,),
                                                                        shape_ptr, body.ptr, length(verts), pointer(verts), radius))
end

function BoxShape(body::Body, width::Real, height::Real, radius::Real)
    PolyShape(ccall(Libdl.dlsym(libchipmunk, :cpBoxShapeNew), Ptr{Cvoid}, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble,), body.ptr, width, height, radius))
end

function get_count(shape::PolyShape)
    ccall(Libdl.dlsym(libchipmunk, :cpPolyShapeGetCount), Int32, (Ptr{Cvoid},), shape.ptr)
end

function get_vert(shape::PolyShape, index::Integer)
    ccall(Libdl.dlsym(libchipmunk, :cpPolyShapeGetVert), Vect, (Ptr{Cvoid}, Int32,), shape.ptr, index)
end

function get_radius(shape::PolyShape)
    ccall(Libdl.dlsym(libchipmunk, :cpPolyShapeGetRadius), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

export PolyShape, get_count, get_vert, get_radius

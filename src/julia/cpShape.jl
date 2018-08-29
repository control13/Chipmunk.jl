function CircleShape(body::Body, radius::Real, offset::Vect)
    CircleShape(ccall(Libdl.dlsym(libchipmunk, :cpCircleShapeNew), Ptr{Cvoid}, (Ptr{Cvoid}, Cdouble, Vect,), body.ptr, radius, offset))
end

function get_offset(shape::CircleShape)
    ccall(Libdl.dlsym(libchipmunk, :cpCircleShapeGetOffset), Vect, (Ptr{Cvoid},), shape.ptr)
end

function get_radius(shape::CircleShape)
    ccall(Libdl.dlsym(libchipmunk, :cpCircleShapeGetRadius), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function SegmentShape(body::Body, a::Vect, b::Vect, radius::Real)
    SegmentShape(ccall(Libdl.dlsym(libchipmunk, :cpSegmentShapeNew), Ptr{Cvoid}, (Ptr{Cvoid}, Vect, Vect, Cdouble,), body.ptr, a, b, radius))
end

function set_neighbors(shape::SegmentShape, prev::Vect, next::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpSegmentShapeSetNeighbors), Cvoid, (Ptr{Cvoid}, Vect, Vect,), shape.ptr, prev, next)
end

function get_a(shape::SegmentShape)
    ccall(Libdl.dlsym(libchipmunk, :cpSegmentShapeGetA), Vect, (Ptr{Cvoid},), shape.ptr)
end

function get_b(shape::SegmentShape)
    ccall(Libdl.dlsym(libchipmunk, :cpSegmentShapeGetB), Vect, (Ptr{Cvoid},), shape.ptr)
end

function get_normal(shape::SegmentShape)
    ccall(Libdl.dlsym(libchipmunk, :cpSegmentShapeGetNormal), Vect, (Ptr{Cvoid},), shape.ptr)
end

function get_radius(shape::SegmentShape)
    ccall(Libdl.dlsym(libchipmunk, :cpSegmentShapeGetRadius), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function free(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeFree), Cvoid, (Ptr{Cvoid},), shape.ptr)
end

function get_space(shape::Shape)
    Space(ccall(Libdl.dlsym(libchipmunk, :cpShapeGetSpace), Ptr{Cvoid}, (Ptr{Cvoid},), shape.ptr))
end

function get_body(shape::Shape)
    Body(ccall(Libdl.dlsym(libchipmunk, :cpShapeGetBody), Ptr{Cvoid}, (Ptr{Cvoid},), shape.ptr))
end

function set_body(shape::Shape, body::Body)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetBody), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), shape.ptr, body.ptr)
end

function get_mass(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetMass), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function set_mass(shape::Shape, mass::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetMass), Cvoid, (Ptr{Cvoid}, Cdouble,), shape.ptr, mass)
end

function get_density(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetDensity), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function set_density(shape::Shape, density::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetDensity), Cvoid, (Ptr{Cvoid}, Cdouble,), shape.ptr, density)
end

function get_moment(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetMoment), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function get_area(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetArea), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function get_center_of_gravity(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetCenterOfGravity), Vect, (Ptr{Cvoid},), shape.ptr)
end

function get_sensor(shape::Shape)
    Bool(ccall(Libdl.dlsym(libchipmunk, :cpShapeGetSensor), UInt8, (Ptr{Cvoid},), shape.ptr))
end

function set_sensor(shape::Shape, sensor::Bool)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetSensor), Cvoid, (Ptr{Cvoid}, Int32,), shape.ptr, sensor)
end

function get_elasticity(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetElasticity), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function set_elasticity(shape::Shape, elasticity::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetElasticity), Cvoid, (Ptr{Cvoid}, Cdouble,), shape.ptr, elasticity)
end

function get_friction(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetFriction), Cdouble, (Ptr{Cvoid},), shape.ptr)
end

function set_friction(shape::Shape, friction::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetFriction), Cvoid, (Ptr{Cvoid}, Cdouble,), shape.ptr, friction)
end

function get_surface_velocity(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetSurfaceVelocity), Vect, (Ptr{Cvoid},), shape.ptr)
end

function set_surface_velocity(shape::Shape, velocity::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetSurfaceVelocity), Cvoid, (Ptr{Cvoid}, Vect,), shape.ptr, velocity)
end

function get_userdata(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetUserData), Ptr{Cvoid}, (Ptr{Cvoid},), shape.ptr)
end

function set_userdata(shape::Shape, userdata::Ptr{Cvoid})
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetUserData), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), shape.ptr, userdata)
end

function get_collision_type(shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeGetCollisionType), UInt32, (Ptr{Cvoid},), shape.ptr)
end

function set_collision_type(shape::Shape, ctype::Integer)
    ccall(Libdl.dlsym(libchipmunk, :cpShapeSetCollisionType), Cvoid, (Ptr{Cvoid}, UInt32,), shape.ptr, ctype)
end

export free, get_space, get_body, set_body, get_mass, set_mass, get_density, set_density, get_moment, get_area,
get_center_of_gravity, get_sensor, set_sensor, get_elasticity, set_elasticity, get_friction, set_friction,
CircleShape, SegmentShape, get_surface_velocity, set_surface_velocity, get_userdata, set_userdata,
get_collision_type, set_collision_type, get_offset, get_radius, get_a, get_b, get_normal

function free(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintFree), Cvoid, (Ptr{Cvoid},), c.ptr)
end

function get_space(c::Constraint)
    Space(ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetSpace), Ptr{Cvoid}, (Ptr{Cvoid},), c.ptr))
end

function get_bodyA(c::Constraint)
    Body(ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetBodyA), Ptr{Cvoid}, (Ptr{Cvoid},), c.ptr))
end

function get_bodyB(c::Constraint)
    Body(ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetBodyB), Ptr{Cvoid}, (Ptr{Cvoid},), c.ptr))
end

function get_max_force(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetMaxForce), Cdouble, (Ptr{Cvoid},), c.ptr)
end

function set_max_force(c::Constraint, max_force::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintSetMaxForce), Cvoid, (Ptr{Cvoid}, Cdouble,), c.ptr, max_force)
end

function get_error_bias(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetErrorBias), Cdouble, (Ptr{Cvoid},), c.ptr)
end

function set_error_bias(c::Constraint, error_bias::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintSetErrorBias), Cvoid, (Ptr{Cvoid}, Cdouble,), c.ptr, error_bias)
end

function get_max_bias(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetMaxBias), Cdouble, (Ptr{Cvoid},), c.ptr)
end

function set_max_bias(c::Constraint, max_bias::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintSetMaxBias), Cvoid, (Ptr{Cvoid}, Cdouble,), c.ptr, max_bias)
end

function get_collide_bodies(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetCollideBodies), Bool, (Ptr{Cvoid},), c.ptr)
end

function set_collide_bodies(c::Constraint, collide_bodies::Bool)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintSetCollideBodies), Cvoid, (Ptr{Cvoid}, Int32,), c.ptr, collide_bodies)
end

function get_userdata(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetUserData), Ptr{Cvoid}, (Ptr{Cvoid},), c.ptr)
end

function set_userdata(c::Constraint, userdata::Ptr{Cvoid})
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintSetUserData), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), c.ptr, userdata)
end

function get_impulse(c::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpConstraintGetImpulse), Cdouble, (Ptr{Cvoid},), c.ptr)
end

export free, get_space, get_bodyA, get_bodyB, get_max_force, set_max_force, get_error_bias,
set_error_bias, get_max_bias, set_max_bias, get_collide_bodies, set_collide_bodies, get_userdata,
set_userdata, get_impulse

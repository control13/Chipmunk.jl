function Space()
    Space(ccall(Libdl.dlsym(libchipmunk, :cpSpaceNew), Ptr{Cvoid}, ()))
end

function free(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceFree), Cvoid, (Ptr{Cvoid},), space.ptr)
end

function get_iterations(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetIterations), Int32, (Ptr{Cvoid},), space.ptr)
end

function set_iterations(space::Space, iterations::Integer)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetIterations), Cvoid, (Ptr{Cvoid}, Int32,), space.ptr, iterations)
end

function get_gravity(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetGravity), Vect, (Ptr{Cvoid},), space.ptr)
end

function set_gravity(space::Space, gravity::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetGravity), Cvoid, (Ptr{Cvoid}, Vect,), space.ptr, gravity)
end

function set_damping(space::Space, damping::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetDamping), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, damping)
end

function get_damping(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetDamping), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function get_idle_speed_threshold(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetIdleSpeedThreshold), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function set_idle_speed_threshold(space::Space, threshold::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetIdleSpeedThreshold), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, threshold)
end

function get_sleep_time_threshold(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetSleepTimeThreshold), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function set_sleep_time_threshold(space::Space, threshold::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetSleepTimeThreshold), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, threshold)
end

function get_collision_slop(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetCollisionSlop), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function set_collision_slop(space::Space, slop::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetCollisionSlop), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, slop)
end

function get_collision_bias(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetCollisionBias), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function set_collision_bias(space::Space, bias::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetCollisionBias), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, bias)
end

function get_collision_persistence(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetCollisionPersistence), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function set_collision_persistence(space::Space, persistence::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetCollisionPersistence), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, persistence)
end

function get_userdata(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetUserData), Ptr{Cvoid}, (Ptr{Cvoid},), space.ptr)
end

function set_userdata(space::Space, userdata::Ptr{Cvoid})
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceSetUserData), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, userdata)
end

function get_current_timestep(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceGetCurrentTimeStep), Cdouble, (Ptr{Cvoid},), space.ptr)
end

function is_locked(space::Space)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceIsLocked), Bool, (Ptr{Cvoid},), space.ptr)
end

function set_default_collision_handler(space)
    CollisionHandler(ccall(Libdl.dlsym(libchipmunk, :cpSpaceAddDefaultCollisionHandler), Ptr{Cvoid}, (Ptr{Cvoid},), space.ptr))
end

function add_shape(space::Space, shape::Shape)
    shape_type = typeof(shape)
    shape_type(ccall(Libdl.dlsym(libchipmunk, :cpSpaceAddShape), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, shape.ptr))
end

function add_body(space::Space, body::Body)
    Body(ccall(Libdl.dlsym(libchipmunk, :cpSpaceAddBody), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, body.ptr))
end

function add_constraint(space::Space, constraint::Constraint)
    constraint_type = typeof(constraint)
    constraint_type(ccall(Libdl.dlsym(libchipmunk, :cpSpaceAddConstraint), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, constraint.ptr))
end

function remove_shape(space::Space, shape::Shape)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceRemoveShape), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, shape.ptr)
end

function remove_body(space::Space, body::Body)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceRemoveBody), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, body.ptr)
end

function remove_constraint(space::Space, constraint::Constraint)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceRemoveConstraint), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, constraint.ptr)
end

# function point_query(space::Space, point::Vect, max_distance::Cdouble, filter::ShapeFilter, out::PointQueryInfo)
    
# end

function use_spatial_hash(space::Space, dim::Real, count::Integer)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceUseSpatialHash), Cvoid, (Ptr{Cvoid}, Cdouble, Cint,), space.ptr, dim, count)
end

function body_iterator_func(body_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    callback = unsafe_pointer_to_objref(data)
    callback(Body(body_ptr))
    return nothing
end

function each_body(space::Space, callback::Function)
    c_callback = @cfunction($body_iterator_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},))
    callback_ptr = pointer_from_objref(callback)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceEachBody), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, c_callback, callback_ptr)
end

function shape_iterator_func(shape_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    callback = unsafe_pointer_to_objref(data)
    callback(Shape(body_ptr))
    return nothing
end

function each_shape(space::Space, callback::Function)
    c_callback = @cfunction($shape_iterator_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},))
    callback_ptr = pointer_from_objref(callback)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceEachShape), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, c_callback, callback_ptr)
end

function constraint_iterator_func(constraint_ptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    callback = unsafe_pointer_to_objref(data)
    callback(Shape(body_ptr))
    return nothing
end

function each_constraint(space::Space, callback::Function)
    c_callback = @cfunction($constraint_iterator_func, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid},))
    callback_ptr = pointer_from_objref(callback)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceEachConstraint), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid},), space.ptr, c_callback, callback_ptr)
end

function step(space::Space, dt::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSpaceStep), Cvoid, (Ptr{Cvoid}, Cdouble,), space.ptr, dt)
end

export Space, get_iterations, set_iterations, get_gravity, set_gravity, set_damping, get_damping, add_body,
remove_body, step, add_shape, add_constraint, remove_constraint, remove_shape, is_locked, get_current_timestep,
get_userdata, set_userdata, set_collision_persistence, get_collision_persistence, set_collision_bias,
get_collision_bias, get_collision_slop, set_collision_slop, set_idle_speed_threshold, get_idle_speed_threshold,
set_sleep_time_threshold, get_sleep_time_threshold, use_spatial_hash, each_body, each_shape, each_constraint

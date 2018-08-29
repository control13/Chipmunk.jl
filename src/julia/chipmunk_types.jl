struct Space
    ptr::Ptr{Cvoid}
end

struct Body
    ptr::Ptr{Cvoid}
end

struct Arbiter
    ptr::Ptr{Cvoid}
end

abstract type Shape end
struct CircleShape <: Shape
    ptr::Ptr{Cvoid}
end

struct SegmentShape <: Shape
    ptr::Ptr{Cvoid}
end

struct PolyShape <: Shape
    ptr::Ptr{Cvoid}
end

abstract type Constraint end
struct SimpleMotor <: Constraint
    ptr::Ptr{Cvoid}
end

struct PivotJoint <: Constraint
    ptr::Ptr{Cvoid}
end

struct PinJoint <: Constraint
    ptr::Ptr{Cvoid}
end

struct GearJoint <: Constraint
    ptr::Ptr{Cvoid}
end

struct SlideJoint <: Constraint
    ptr::Ptr{Cvoid}
end

struct DampedSpring <: Constraint
    ptr::Ptr{Cvoid}
end

struct CollisionHandler
    ptr::Ptr{Cvoid}
end

struct BB
    l::Cdouble
    b::Cdouble
    r::Cdouble
    t::Cdouble
end

struct Vect
    x::Cdouble
    y::Cdouble
end

struct Transform
    a::Cdouble
    b::Cdouble
    c::Cdouble
    d::Cdouble
    tx::Cdouble
    ty::Cdouble
end

struct Mat2x2
    a::Cdouble
    b::Cdouble
    c::Cdouble
    d::Cdouble
end

export Vect, Body, Space, Shape, CircleShape, SegmentShape,
PolyShape, Transform, Mat2x2, BB, CollisionHandler, Constraint,
SimpleMotor, PivotJoint, PinJoint, GearJoint, SlideJoint,
DampedSpring

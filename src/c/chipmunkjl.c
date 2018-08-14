#include <chipmunk.h>
#include <stdlib.h>

cpSpaceDebugDrawOptions* cpjlDebugDrawOptions(cpSpaceDebugDrawCircleImpl drawCircle,
                         cpSpaceDebugDrawSegmentImpl drawSegment,
                         cpSpaceDebugDrawFatSegmentImpl drawFatSegment,
                         cpSpaceDebugDrawPolygonImpl drawPolygon,
                         cpSpaceDebugDrawDotImpl drawDot,
                         cpSpaceDebugDrawFlags flags,
                         cpSpaceDebugColor outlineColor,
                         cpSpaceDebugDrawColorForShapeImpl colorForShape,
                         cpSpaceDebugColor constraintColor,
                         cpSpaceDebugColor collisionPointColor,
                         cpDataPointer data) {
    cpSpaceDebugDrawOptions* options = malloc(sizeof(cpSpaceDebugDrawOptions));
    options->drawCircle = drawCircle;
    options->drawSegment = drawSegment;
    options->drawFatSegment = drawFatSegment;
    options->drawPolygon = drawPolygon;
    options->drawDot = drawDot;

    options->flags = flags;
    options->shapeOutlineColor = outlineColor;
    options->colorForShape = colorForShape;
    options->constraintColor = constraintColor;
    options->collisionPointColor = collisionPointColor;

    options->data = data;

    return options;
}

void cpjlSetCollisionHandler(cpSpace *space, cpCollisionType a, cpCollisionType b, cpCollisionBeginFunc beginFunc, cpCollisionPreSolveFunc preSolveFunc, cpCollisionPostSolveFunc postSolveFunc, cpCollisionSeparateFunc separateFunc) {
    cpCollisionHandler *handler = cpSpaceAddCollisionHandler(space, a, b);
    if(beginFunc != NULL) {
	    handler->beginFunc = (cpCollisionBeginFunc)beginFunc;
    }
    if(preSolveFunc != NULL) {
	    handler->preSolveFunc = (cpCollisionPreSolveFunc)preSolveFunc;
    }
    if(postSolveFunc != NULL) {
	    handler->postSolveFunc = (cpCollisionPostSolveFunc)postSolveFunc;
    }
    if(separateFunc != NULL) {
	    handler->separateFunc = (cpCollisionSeparateFunc)separateFunc;
    }
}

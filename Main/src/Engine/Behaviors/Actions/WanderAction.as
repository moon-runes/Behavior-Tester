package Engine.Behaviors.Actions {
import Display.Assets.Objects.Entity;

import Engine.Behaviors.Actions.Utils.WanderStorage;
import Engine.Behaviors.Modals.Wander;

import flash.utils.getTimer;

public class WanderAction extends Action
{
    private var action:Wander;
    private var wanderStorage:WanderStorage;
    private var directionChangeInterval:Number = 1000;
    private var lastDirectionChange:Number = 0;

    public function WanderAction(entity:Entity, action:Wander)
    {
        super(entity);
        this.action = action;
        this.wanderStorage = new WanderStorage();
        this.lastDirectionChange = getTimer();
    }

    public override function update() : void
    {
        if (this.entity == null)
            return;

        updateTime();

        var timeDelta:Number = this.elapsedTime / 1000;
        var dist:Number = this.action.speed * (Main.TILE_SIZE * 1.5) * timeDelta;
        var currentTime:Number = getTimer();
        if (currentTime - this.lastDirectionChange > directionChangeInterval) {
            this.wanderStorage.direction.x = Math.random() * 2 - 1;
            this.wanderStorage.direction.y = Math.random() * 2 - 1;
            this.wanderStorage.direction.normalize(1);
            this.lastDirectionChange = currentTime;
        }

        this.entity.x += this.wanderStorage.direction.x * dist;
        this.entity.y += this.wanderStorage.direction.y * dist;
        this.wanderStorage.remainingDistance = .6;

        resetTime();
    }
}
}

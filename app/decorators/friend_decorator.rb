class FriendDecorator < Draper::Decorator
    def checkBoxOne
        object.checkBoxOne ? "◯" : "☓"
    end

    def checkBoxTwo
        object.checkBoxOne ? "◯" : "☓"
    end

    def checkBoxThree
        object.checkBoxOne ? "◯" : "☓"
    end
    
end
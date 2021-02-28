class Api::V1::SchedulesController < ApplicationController

    def create
        schedule = Schedule.create(schedule_params)
        
        if schedule.valid?
            render json: schedule
        else
            render json: schedule.errors.messages
        end
    end     

    def update
        schedule = Schedule.find_by(id: schedule_params[:id])

        if schedule.valid?
            schedule.update(schedule_params)
            render json: { schedule: schedule}
        else 
            render json: {error: schedule.errors.messages} 
        end 
    end 





private

    def schedule_params
        params.require(:schedule).permit(:id, :mon_start, :mon_end, :tues_start, :tues_end, :wed_start, :wed_end, :thurs_start, :thurs_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end, :new_years_day_start, :new_years_day_end, :thanksgiving_day_start, :thanksgiving_day_end, :christmas_day_start, :christmas_day_end, :foodtruck_id)
    end 
end

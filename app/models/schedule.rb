class Schedule < ApplicationRecord
    belongs_to :food_truck

    def create
        schedule = Schedule.create(schedule_params)
        render json: schedule
    end     







private

    def schedule_params
        params.require(:schedule).permit(:mon_start, :mon_end, :tues_start, :tues_end, :wed_start, :wed_end, :thurs_start, :thurs_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end, :new_years_day, :thanksgiving_day, :christmas_day, :food_truck_id)
    end 

end

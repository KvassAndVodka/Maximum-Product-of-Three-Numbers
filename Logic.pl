% Base case for finding max three and min two numbers
update_extremes([], Max1, Max2, Max3, Min1, Min2, Max1, Max2, Max3, Min1, Min2).
update_extremes([N|Rest], CurrentMax1, CurrentMax2, CurrentMax3, CurrentMin1, CurrentMin2, Max1, Max2, Max3, Min1, Min2) :-
    % Update maximums
    (N > CurrentMax1 ->
        NewMax1 = N, NewMax2 = CurrentMax1, NewMax3 = CurrentMax2;
    N > CurrentMax2 ->
        NewMax1 = CurrentMax1, NewMax2 = N, NewMax3 = CurrentMax2;
    N > CurrentMax3 ->
        NewMax1 = CurrentMax1, NewMax2 = CurrentMax2, NewMax3 = N;
        NewMax1 = CurrentMax1, NewMax2 = CurrentMax2, NewMax3 = CurrentMax3),

    % Update minimums
    (N < CurrentMin1 ->
        NewMin1 = N, NewMin2 = CurrentMin1;
    N < CurrentMin2 ->
        NewMin1 = CurrentMin1, NewMin2 = N;
        NewMin1 = CurrentMin1, NewMin2 = CurrentMin2),

    % Recur with updated extremes
    update_extremes(Rest, NewMax1, NewMax2, NewMax3, NewMin1, NewMin2, Max1, Max2, Max3, Min1, Min2).

% Calculate the maximum product of three numbers
maximum_product(List, Result) :-
    % Initialize extremes
    update_extremes(List, -inf, -inf, -inf, inf, inf, Max1, Max2, Max3, Min1, Min2),
    % Compute two potential products
    Product1 is Max1 * Max2 * Max3,
    Product2 is Max1 * Min1 * Min2,
    % Result is the maximum of the two
    Result is max(Product1, Product2).
% Main function to test the program
main :-
    write('Enter the list of numbers (as a Prolog list, e.g., [1, -10, 2, -10, 5]): '),
    read(InputList),
    maximum_product(InputList, Result),
    format('Maximum product of three number is:~w~n', [Result]).

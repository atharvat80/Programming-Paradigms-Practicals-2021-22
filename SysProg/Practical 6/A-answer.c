#include <stdio.h>
#include <stdlib.h>

struct link
{
	int data;          // node data
	struct link *next; // pointer to next node
};

void add_to_end_of_list(struct link **head, int data);
void print_list(struct link *current);
void free_list(struct link *current);

void add_to_end_of_list(struct link **head, int data)
{ 
	// Create a pointer that points to tail of the list
	// To begin with we will start at the head node
	struct link *current = *head;
	// Treverse through the list until we reach the tail node,
	// updating our pointer to the current node each time
	if (current != NULL)
		while (current->next != NULL)
			current = current->next;

	// Once we've reached the tail node, create a pointer for
	// our new tail node, allocate some memory to it and 
	// populate that memory with the provided data
	struct link *new = malloc(sizeof(struct link));
	if (new == NULL)
	{
		fprintf(stderr, "malloc() failed\n");
		exit(1);
	}
	new->next = NULL;
	new->data = data;

	// If the list was empty to begin with, update the head 
	// pointer to point to our newly created node
	// Otherwise set the next node of the current node as 
	// our newly created node
	if (*head == NULL)
		*head = new;
	else
		current->next = new;
}

void print_list(struct link *current)
{
	while (current != NULL)
	{
		printf("%d\n", current->data);
		current = current->next;
	}
}

void free_list(struct link *current)
{
	if (current != NULL)
	{
		free_list(current->next);
		free(current);
	}
}

int main()
{
	struct link *head = NULL;
	int tmp;
	while (scanf("%d", &tmp) != EOF)
		add_to_end_of_list(&head, tmp);
	print_list(head);
	free_list(head);
	return 0;
}
